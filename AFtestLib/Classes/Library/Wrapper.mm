//
//  Wrapper.cpp
//  EmptyProjectSBC
//
//  Created by Alexandru Dranca on 23/04/2019.
//  Copyright © 2019 Fortech SRL. All rights reserved.
//

#include <stdio.h>
#include "connect_sdk.h"

extern "C" const char* test_get(const char* input) {
    return echo_call(input);
}

extern "C" int test_post() {
    return test_call();
}
