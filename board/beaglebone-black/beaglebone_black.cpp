////////////////////////////////////////////////////////////////////////////////////////////////
///
/// @file
/// @author     Kuba Sejdak
/// @date       21.08.2016
///
/// @copyright  This file is a part of cosmos OS. All rights reserved.
///
////////////////////////////////////////////////////////////////////////////////////////////////

#include "beaglebone_black.h"
#include "beaglebone_black_pinmux.h"

#include <core/console.h>
#include <dev/device_manager.h>
#include <dev/gpio.h>
#include <dev/uart.h>
#include <dev/ti_am335x/am335x_gpio.h>
#include <dev/ti_am335x/am335x_uart.h>

using namespace Device;
using namespace Device::GPIO;
using namespace Device::UART;

namespace Board {

IBoard* IBoard::create()
{
    return new BeagleBoneBlack();
}

BeagleBoneBlack::BeagleBoneBlack()
{
    m_name = "BeagleBone Black";
    m_vendor = "Texas Instruments";
    m_version = "1.0";
}

bool BeagleBoneBlack::initDevice()
{
    DeviceManager<IGPIOPort>::init();
    DeviceManager<IUART>::init();

    initUserLED();
    initConsole();

    return true;
}

bool BeagleBoneBlack::initUserLED()
{
    // Init user led0.
    GPIOPin led0(PIN_USER_LED0);
    led0.setFunction(FUNCTION_7);
    led0.setDirection(DIRECTION_OUTPUT);
    led0.setResistor(RESISTOR_NONE);
    led0.write(true);

    return true;
}

bool BeagleBoneBlack::initConsole()
{
    // Init console on UART1.
    GPIOPin consoleTx(PIN_SERIAL_DEBUG_TX);
    consoleTx.setFunction(FUNCTION_0);
    consoleTx.setDirection(DIRECTION_OUTPUT);
    consoleTx.setResistor(RESISTOR_NONE);

    AM335x_UART consoleUart(UART_0);
    consoleUart.setBaudRate(115200);
    consoleUart.setDataBits(DATA_BITS_8);
    consoleUart.setStopBits(STOP_BITS_1);
    consoleUart.setPartity(PARTITY_NONE);
    consoleUart.setFlowControl(FLOW_CONTROL_NONE);
    consoleUart.setDirection(DIRECTION_WRITE);
    consoleUart.setTransmissionMode(MODE_ASYNCHRONOUS);

    consoleUart.write("DUPA BLADA\r\n", 12);

    return console.init();

}

} // namespace Board
