#include <fstream>
#include <iostream>
#include <iomanip>
#include <vector>
#include <sstream>

#define HEIGHT_LENGTH 12
#define WIDTH_LENGTH 16

std::string area_name;

void write_value(int prev_value, int prev_value_length, std::ofstream &dst) {
  if (prev_value == -1)
    dst << ".db $FD, $" << std::hex << std::setw(2) << prev_value_length << std::endl;
  else if (prev_value_length == 1)
    dst << ".db $" << std::hex << std::setw(2) << std::setfill('0') << prev_value << std::endl;
  else
    dst << ".db $FC, $" << std::hex << std::setw(2) << std::setfill('0') << prev_value_length << ", $" << std::hex << std::setw(2) <<  std::setfill('0') << prev_value << std::endl;
}

void parse_data(std::vector<std::vector<int>> &vector, int index, std::ofstream &dst) {
  int starting_index = index * WIDTH_LENGTH;

  int prev_value = 0xFF;
  int prev_value_length = 1;

  for (int height = 0; height != HEIGHT_LENGTH; height++) {
    for (int width = 0; width != WIDTH_LENGTH; width++) {
      int value = vector[height][width + starting_index];
      if (value == prev_value)
        prev_value_length++;
      else {
        if (prev_value != 0xFF)
          write_value(prev_value, prev_value_length, dst);
        prev_value_length = 1;
        prev_value = value;
      }
    }
  }
  write_value(prev_value, prev_value_length, dst);
}

void iterate_data(std::vector<std::vector<int>> &vector) {
  int screen_size = (vector[0].size() / WIDTH_LENGTH);
  std::ofstream dst("../src/levels/foreground/" + area_name);
  
  dst << area_name << ":" << std::endl;
  
  for (int index = 0; index != screen_size; index++) {
    if (index)
      dst << ".db $FE" << std::endl;
    parse_data(vector, index, dst);
  }
  dst << ".db $FF" << std::endl;
}

int main(int argc, char **argv) {
  if (argc < 2){
    std::cout << argc << std::endl;
    return 1;
  }
  
  std::ifstream file(argv[1]);
  std::vector<std::vector<int>> vector;

  area_name = argv[2];
  std::string line;
  int index = 0;
  while (std::getline(file, line)) {
    std::vector<int> row;
    std::string cell;
    std::stringstream ss(line);
  
    while (std::getline(ss, cell, ',')) {
      row.push_back(std::stoi(cell));
    }

    vector.push_back(row);
  }
  iterate_data(vector);
  return 0;
}
