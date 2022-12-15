// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract Force {
    /*

                   MEOW ?
         /\_/\   /
    ____/ o o \
  /~____  =ø= /
 (______)__m_m)

*/
}

contract AttackForce {
    Force f;

    constructor(address _forceAddress) {
        f = Force(_forceAddress);
    }
}
