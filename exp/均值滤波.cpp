#include <iostream>  
#include <vector>  
#include <cmath>  
  
using namespace std;  
  
vector<vector<int>> blur(vector<vector<int>>& src, int height_filter, int width_filter) {  
    int height_src = src.size();  
    int width_src = src[0].size();  
    vector<vector<int>> dst(height_src, vector<int>(width_src, 0));  
  
    int filter_size = height_filter * width_filter;  
  
    int filter_half_height = height_filter / 2;  
    int filter_half_width = width_filter / 2;  
  
    for (int i = 0; i < height_src; i++) {  
        for (int j = 0; j < width_src; j++) {  
            int sum = 0;  
            for (int k = -filter_half_height; k <= filter_half_height; k++) {  
                for (int l = -filter_half_width; l <= filter_half_width; l++) {  
                    int row = i + k;  
                    int col = j + l;  
  
                    if (row >= 0 && row < height_src && col >= 0 && col < width_src) {  
                        sum += src[row][col];  
                    }  
                }  
            }  
            dst[i][j] = round(sum / (double)filter_size);  
        }  
    }  
  
    return dst;  
}  
  
int main() {  
    int height_src, width_src, height_filter, width_filter;  
    cin >> height_src >> width_src >> height_filter >> width_filter;  
  
    vector<vector<int>> src(height_src, vector<int>(width_src, 0));  
    for (int i = 0; i < height_src; i++) {  
        for (int j = 0; j < width_src; j++) {  
            cin >> src[i][j];  
        }  
    }  
  
    vector<vector<int>> dst = blur(src, height_filter, width_filter);  
  
    for (int i = 0; i < height_src; i++) {  
        for (int j = 0; j < width_src; j++) {  
            cout << dst[i][j] << " ";  
        }  
        cout << endl;  
    }  
  
    return 0;  
}  