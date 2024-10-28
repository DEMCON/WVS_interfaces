# State for / of the statemachine used in vehicle
uint8 state

uint8 UNDEFINED             = 0  # Initial state, should not happen
uint8 IDLE                  = 1  # Robot is enabled, but no control allowed
uint8 REMOTE                = 2  # The robot is being controlled by the remote
uint8 AUTO                  = 3  # The robot is being controlled by autonomy stack