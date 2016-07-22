////////////////////////////////////////////////////////////////////////////////////////////////
///
/// @file
/// @author     Kuba Sejdak
/// @date       21.07.2016
///
/// @copyright  This file is a part of cosmos OS. All rights reserved.
///
////////////////////////////////////////////////////////////////////////////////////////////////

#ifndef PAGEPOOL_H
#define PAGEPOOL_H

#include "page.h"

namespace Memory {

class IPagePool {
public:
    virtual bool init() = 0;

    virtual PhysicalPage* allocatePage() = 0;
    virtual void releasePage(PhysicalPage* page) = 0;

    virtual int getPagesCount() = 0;
};

} // namespace Memory

#endif