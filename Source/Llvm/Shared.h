#pragma once

#include "Build.h"
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

} /* ~Namespace Dcp */
