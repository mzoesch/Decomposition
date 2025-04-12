#pragma once

#if defined(_WIN32) || defined(_WIN64)
    #define PRIVATE_DCP_EXPORT __declspec(dllexport)
    #define PRIVATE_DCP_IMPORT __declspec(dllimport)
#else /* _WIN32 || _WIN64 */
    #define PRIVATE_DCP_EXPORT __attribute__((visibility("default")))
    #define PRIVATE_DCP_IMPORT
#endif /* !(_WIN32 || _WIN64) */

#ifndef DCP_API
    #define DCP_API PRIVATE_DCP_IMPORT
#endif /* DCP_API */

#define dcp_check(Expr)                                   \
    if (!!(!(Expr)))                                      \
    {                                                     \
        llvm::report_fatal_error("Check failed: " #Expr); \
    }

#define dcp_noentry(Msg) \
    llvm::report_fatal_error("No entry: " Msg);

#define dcp_checkcode(Stmt) \
    do { Stmt; } while (0);

enum : signed char
{
    INDEX_NONE = -1,
};

// Turn this on to attach gdb to the process on linux. The program will wait for gdb to attach before continuing.
#ifndef WITH_GDB_LINUX
    #define WITH_GDB_LINUX          0
#endif /* WITH_GDB_LINUX */
