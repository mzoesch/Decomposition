#pragma once

#if defined(_WIN32) || defined(_WIN64)
    #define PRIVATE_DCP_EXPORT                  __declspec(dllexport)
    #define PRIVATE_DCP_IMPORT                  __declspec(dllimport)
    #define DCP_HAL_ALLOWS_WITH_GDB_LINUX       0
#else /* _WIN32 || _WIN64 */
    #define PRIVATE_DCP_EXPORT                  __attribute__((visibility("default")))
    #define PRIVATE_DCP_IMPORT
    #define DCP_HAL_ALLOWS_WITH_GDB_LINUX       1
#endif /* !(_WIN32 || _WIN64) */

#ifndef DCP_API
    #define DCP_API                             PRIVATE_DCP_IMPORT
#endif /* DCP_API */

#ifndef DCP_IN_DEBUG
    #define DCP_IN_DEBUG                        0
#endif /* !DCP_IN_DEBUG */

#ifndef DCP_DO_OUT_CHECKS
    #define DCP_DO_OUT_CHECKS                   0
#endif /* !DCP_DO_OUT_CHECKS */

#ifndef DCP_WITH_GDB_LINUX
    #if DCP_IN_DEBUG
        #if DCP_HAL_ALLOWS_WITH_GDB_LINUX && !defined(WITH_GDB_LINUX)
            #define DCP_WITH_GDB_LINUX          1
        #endif /* DCP_HAL_ALLOWS_WITH_GDB_LINUX && !defined(WITH_GDB_LINUX) */
    #else /* DCP_IN_DEBUG */
        #ifndef DCP_WITH_GDB_LINUX
            #define DCP_WITH_GDB_LINUX          0
        #endif /* !DCP_WITH_GDB_LINUX */
    #endif /* !DCP_IN_DEBUG */
#endif /* !DCP_WITH_GDB_LINUX */

#if DCP_WITH_GDB_LINUX
    #include <unistd.h>
#endif /* DCP_WITH_GDB_LINUX */

enum : signed char
{
    INDEX_NONE                                  = -1,
};

#if DCP_IN_DEBUG

    #if DCP_HAL_ALLOWS_WITH_GDB_LINUX
        #define DEBUG_TRAP()                    __asm__("int3");
    #else /* DCP_HAL_ALLOWS_WITH_GDB_LINUX */
        #define DEBUG_TRAP()
    #endif /* !DCP_HAL_ALLOWS_WITH_GDB_LINUX */

    #if DCP_WITH_GDB_LINUX
        #define PRIVATE_DCP_FAIL_BOILERPLATE()                       \
            if (::Dcp::bWaitForDebuggerOnFail)                       \
            {                                                        \
                ::llvm::outs() << "FAIL: Waiting for debugger...\n"; \
                ::llvm::outs().flush();                              \
                while (::Dcp::IsGdb() == false)                      \
                {                                                    \
                    usleep(static_cast<int>(1 * (1e+6)));            \
                }                                                    \
                DEBUG_TRAP()                                         \
            }
    #else /* DCP_WITH_GDB_LINUX */
        #define PRIVATE_DCP_FAIL_BOILERPLATE()
    #endif /* !DCP_WITH_GDB_LINUX */

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

#else /* DCP_IN_DEBUG */

    #define dcp_check(Expr)
    #define dcp_noentry(Msg)
    #define dcp_checkcode(Stmt)

#endif /* !DCP_IN_DEBUG */

#if DCP_WITH_GDB_LINUX
    /**
     * Linux Hal.
     */
    namespace Dcp
    {

    DCP_API extern bool bWaitForDebuggerOnFail;
    DCP_API bool IsGdb();

    } /* ~Namespace Dcp */
#endif /* DCP_WITH_GDB_LINUX */

#include <string>

namespace Dcp
{

/**
 * Path to the IR file.
 */
DCP_API extern std::string IrPath;

} /* ~Namespace Dcp */
