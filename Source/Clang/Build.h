#pragma once

#if defined(_WIN32) || defined(_WIN64)
    #define PRIVATE_PREDCP_EXPORT __declspec(dllexport)
    #define PRIVATE_PREDCP_IMPORT __declspec(dllimport)
#else /* _WIN32 || _WIN64 */
    #define PRIVATE_PREDCP_EXPORT __attribute__((visibility("default")))
    #define PRIVATE_PREDCP_IMPORT
#endif /* !(_WIN32 || _WIN64) */

#ifndef PREDCP_API
    #define PREDCP_API PRIVATE_DCP_IMPORT
#endif /* PREDCP_API */

// Not great. But ok for now.
#define predcp_check(Expr)                                \
    if (!!(!(Expr)))                                      \
    {                                                     \
        llvm::report_fatal_error("Check failed: " #Expr); \
    }

#define predcp_noentry(Msg) \
    llvm::report_fatal_error("No entry: " Msg);

#define predcp_checkcode(Stmt) \
    do { Stmt; } while (0);

enum : signed char
{
    INDEX_NONE = -1,
};
