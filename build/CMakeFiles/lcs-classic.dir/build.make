# CMAKE generated file: DO NOT EDIT!
# Generated by "Unix Makefiles" Generator, CMake Version 3.16

# Delete rule output on recipe failure.
.DELETE_ON_ERROR:


#=============================================================================
# Special targets provided by cmake.

# Disable implicit rules so canonical targets will work.
.SUFFIXES:


# Remove some rules from gmake that .SUFFIXES does not remove.
SUFFIXES =

.SUFFIXES: .hpux_make_needs_suffix_list


# Suppress display of executed commands.
$(VERBOSE).SILENT:


# A target that is always out of date.
cmake_force:

.PHONY : cmake_force

#=============================================================================
# Set environment variables for the build.

# The shell in which to execute make rules.
SHELL = /bin/sh

# The CMake executable.
CMAKE_COMMAND = /usr/bin/cmake

# The command to remove a file.
RM = /usr/bin/cmake -E remove -f

# Escaping for special characters.
EQUALS = =

# The top-level source directory on which CMake was run.
CMAKE_SOURCE_DIR = /home/abiyaz/LCS_Rezaul

# The top-level build directory on which CMake was run.
CMAKE_BINARY_DIR = /home/abiyaz/LCS_Rezaul/build

# Include any dependencies generated for this target.
include CMakeFiles/lcs-classic.dir/depend.make

# Include the progress variables for this target.
include CMakeFiles/lcs-classic.dir/progress.make

# Include the compile flags for this target's objects.
include CMakeFiles/lcs-classic.dir/flags.make

CMakeFiles/lcs-classic.dir/lcs-classic.cpp.o: CMakeFiles/lcs-classic.dir/flags.make
CMakeFiles/lcs-classic.dir/lcs-classic.cpp.o: ../lcs-classic.cpp
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/abiyaz/LCS_Rezaul/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building CXX object CMakeFiles/lcs-classic.dir/lcs-classic.cpp.o"
	/usr/bin/c++  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/lcs-classic.dir/lcs-classic.cpp.o -c /home/abiyaz/LCS_Rezaul/lcs-classic.cpp

CMakeFiles/lcs-classic.dir/lcs-classic.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/lcs-classic.dir/lcs-classic.cpp.i"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/abiyaz/LCS_Rezaul/lcs-classic.cpp > CMakeFiles/lcs-classic.dir/lcs-classic.cpp.i

CMakeFiles/lcs-classic.dir/lcs-classic.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/lcs-classic.dir/lcs-classic.cpp.s"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/abiyaz/LCS_Rezaul/lcs-classic.cpp -o CMakeFiles/lcs-classic.dir/lcs-classic.cpp.s

# Object files for target lcs-classic
lcs__classic_OBJECTS = \
"CMakeFiles/lcs-classic.dir/lcs-classic.cpp.o"

# External object files for target lcs-classic
lcs__classic_EXTERNAL_OBJECTS =

lcs-classic: CMakeFiles/lcs-classic.dir/lcs-classic.cpp.o
lcs-classic: CMakeFiles/lcs-classic.dir/build.make
lcs-classic: CMakeFiles/lcs-classic.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --bold --progress-dir=/home/abiyaz/LCS_Rezaul/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Linking CXX executable lcs-classic"
	$(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/lcs-classic.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
CMakeFiles/lcs-classic.dir/build: lcs-classic

.PHONY : CMakeFiles/lcs-classic.dir/build

CMakeFiles/lcs-classic.dir/clean:
	$(CMAKE_COMMAND) -P CMakeFiles/lcs-classic.dir/cmake_clean.cmake
.PHONY : CMakeFiles/lcs-classic.dir/clean

CMakeFiles/lcs-classic.dir/depend:
	cd /home/abiyaz/LCS_Rezaul/build && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/abiyaz/LCS_Rezaul /home/abiyaz/LCS_Rezaul /home/abiyaz/LCS_Rezaul/build /home/abiyaz/LCS_Rezaul/build /home/abiyaz/LCS_Rezaul/build/CMakeFiles/lcs-classic.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : CMakeFiles/lcs-classic.dir/depend

