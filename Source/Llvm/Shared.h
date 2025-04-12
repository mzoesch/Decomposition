#pragma once

#include "Build.h"
#include <llvm/IR/DerivedTypes.h>
#include <llvm/IR/Module.h>
#include <llvm/IR/DebugInfoMetadata.h>
#include <string>
#include <limits>

namespace Dcp
{

struct MyNodeRef;
struct MyNode;

/** Generic node reference. */
struct MyNodeRef
{
    virtual ~MyNodeRef() = default;

    std::string Identifier;
    std::string Source;

    DCP_API virtual bool operator==(const MyNodeRef& Other) const;
    DCP_API virtual bool IsValid() const;
};

/** Generic node definition. */
struct MyNode : public MyNodeRef
{
    virtual ~MyNode() override = default;

    /* Line of definition. */
    int Line = std::numeric_limits<int>::max();

    DCP_API virtual bool operator==(const MyNode& Other) const;
    DCP_API virtual bool IsValid() const override;
};

const llvm::DIType* FindDiType(const llvm::Module& M, const llvm::dwarf::Tag Tag, const llvm::StringRef& InName);
const llvm::DIType* FindDiTypeChecked(const llvm::Module& M, const llvm::dwarf::Tag Tag, const llvm::StringRef& Name);

inline const llvm::DIType* FindDiTypeChecked(const llvm::Module& M, const llvm::dwarf::Tag Tag, const llvm::StringRef& Name)
{
    const llvm::DIType* DiTy = FindDiType(M, Tag, Name);
    dcp_check( DiTy )
    return DiTy;
}

} /* ~Namespace Dcp */
