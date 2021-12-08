#include <iostream>
#include <chrono> //эта библиотека отвечает за концепты, связанные со временем
#include <vector>
#include <numeric>
#include <execution>

using namespace std;

int main()
{
  std::vector<int> v(200'000'001, 1);

  const auto startTime = chrono::high_resolution_clock::now();
  int result = std::accumulate(v.begin(), v.end(), 0);
  const auto endTime = chrono::high_resolution_clock::now();
  cout << "std::accumulate execution time: "s << chrono::duration_cast<chrono::duration<int, milli>>(endTime - startTime).count() << " ms."s << endl;

  const auto startTimeReduce = chrono::high_resolution_clock::now();
  int resultReduce = std::reduce(execution::par, v.begin(), v.end(), 0);
  const auto endTimeReduce = chrono::high_resolution_clock::now();
  cout << "std::reduce execution time: "s << chrono::duration_cast<chrono::duration<int, milli>>(endTimeReduce - startTimeReduce).count() << " ms."s << endl;
}
