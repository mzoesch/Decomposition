#pragma once

#if defined(_WIN32) || defined(_WIN64)
    #define PRIVATE_DCP_EXPORT                  __declspec(dllexport)
    #define PRIVATE_DCP_IMPORT                  __declspec(dllimport)
    #define HAL_ALLOWS_WITH_GDB_LINUX           0
#else /* _WIN32 || _WIN64 */
    #define PRIVATE_DCP_EXPORT                  __attribute__((visibility("default")))
    #define PRIVATE_DCP_IMPORT
    #define HAL_ALLOWS_WITH_GDB_LINUX           1
#endif /* !(_WIN32 || _WIN64) */

#ifndef DCP_API
    #define DCP_API                 PRIVATE_DCP_IMPORT
#endif /* DCP_API */

#ifndef IN_DEBUG
    /*
     * TODO: Default to debug? Maybe later to release... We should make this obvious in CMake.
     */
    #define IN_DEBUG                            1
#endif /* !IN_DEBUG */

#if IN_DEBUG
    #if HAL_ALLOWS_WITH_GDB_LINUX && !defined(WITH_GDB_LINUX)
        #define WITH_GDB_LINUX                  1
        #include <unistd.h>
    #endif /* HAL_ALLOWS_WITH_GDB_LINUX && !defined(WITH_GDB_LINUX) */
#else /* IN_DEBUG */
    #ifndef WITH_GDB_LINUX
        #define WITH_GDB_LINUX                  0
    #endif /* !WITH_GDB_LINUX */
#endif /* !IN_DEBUG */

enum : signed char
{
    INDEX_NONE = -1,
};

#if IN_DEBUG

#if HAL_ALLOWS_WITH_GDB_LINUX
    /**
     * Traps gdb.
     */
    #define DEBUG_TRAB() __asm__("int3");
#else /* HAL_ALLOWS_WITH_GDB_LINUX */
    #define DEBUG_TRAB()
#endif /* !HAL_ALLOWS_WITH_GDB_LINUX */

    #define PRIVATE_DCP_FAIL_BOILERPLATE()                       \
        if (::Dcp::bWaitForDebuggerOnFail)                       \
        {                                                        \
            ::llvm::outs() << "FAIL: Waiting for debugger...\n"; \
            ::llvm::outs().flush();                              \
            while (::Dcp::IsGdb() == false)                      \
            {                                                    \
                usleep(static_cast<int>(1 * (1e+6)));            \
            }                                                    \
            DEBUG_TRAB()                                         \
        }

    // Not great. But ok for now.
    #define dcp_check(Expr)                                   \
        if (!!(!(Expr)))                                      \
        {                                                     \
            PRIVATE_DCP_FAIL_BOILERPLATE()                    \
            llvm::report_fatal_error("Check failed: " #Expr); \
        }

    #define dcp_noentry(Msg)                            \
        {                                               \
            PRIVATE_DCP_FAIL_BOILERPLATE()              \
            llvm::report_fatal_error("No entry: " Msg); \
        }
#define dcp_checkcode(Stmt) \
    do { Stmt; } while (0);

#else /* IN_DEBUG */
    #define dcp_check(Expr)
    #define dcp_noentry(Msg)
    #define dcp_checkcode(Stmt)
#endif /* !IN_DEBUG */

#if WITH_GDB_LINUX
/**
 * Linux Hal.
 */
namespace Dcp
{

DCP_API extern bool bWaitForDebuggerOnFail;
DCP_API bool IsGdb();

} /* ~Namespace Dcp */
#endif /* WITH_GDB_LINUX */
