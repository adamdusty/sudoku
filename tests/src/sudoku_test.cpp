#include "lib.hpp"
#include <snitch/snitch.hpp>

TEST_CASE("Greeting", "[lib]") {
CHECK(sudoku::greeting() == "hello from lib");
}
