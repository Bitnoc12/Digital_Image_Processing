#include <iostream>
#include <vector>
#include <queue>
#include <algorithm>

using namespace std;

// 定义图像大小上限
const int MAX_ROWS = 100;
const int MAX_COLS = 100;

// 定义像素坐标结构体
struct Pixel {
    int x, y;
};

// 定义方向数组，用于4邻域或8邻域的搜索
const int dx[] = {0, 0, 1, -1, 1, 1, -1, -1};
const int dy[] = {1, -1, 0, 0, 1, -1, 1, -1};

// 比较函数，用于排序像素坐标
bool comparePixels(const Pixel &a, const Pixel &b) {
    if (a.y == b.y) {
        return a.x < b.x;
    }
    return a.y < b.y;
}

// 连通域检测函数
void connectedComponents(int image[MAX_ROWS][MAX_COLS], int rows, int cols, int k) {
    vector<vector<bool>> visited(rows, vector<bool>(cols, false));
    int componentCount = 0;

    for (int i = 0; i < rows; ++i) {
        for (int j = 0; j < cols; ++j) {
            if (image[i][j] == 1 && !visited[i][j]) {
                // 找到一个新的连通域
                componentCount++;
                cout << componentCount << "-th component:" << endl;

                vector<Pixel> pixels;  // 存储当前连通域的像素坐标

                queue<Pixel> q;
                q.push({j, i});
                visited[i][j] = true;

                while (!q.empty()) {
                    Pixel current = q.front();
                    q.pop();
                    pixels.push_back(current);

                    for (int dir = 0; dir < k; ++dir) {
                        int newX = current.x + dx[dir];
                        int newY = current.y + dy[dir];

                        if (newX >= 0 && newX < cols && newY >= 0 && newY < rows &&
                            image[newY][newX] == 1 && !visited[newY][newX]) {
                            q.push({newX, newY});
                            visited[newY][newX] = true;
                        }
                    }
                }

                // 按照指定顺序排序并输出像素坐标
                sort(pixels.begin(), pixels.end(), comparePixels);
                for (const auto &pixel : pixels) {
                    cout << pixel.x << " " << pixel.y << endl;
                }
            }
        }
    }
}

int main() {
    int rows, cols, k;
    cin >> cols >> rows >> k;

    int image[MAX_ROWS][MAX_COLS];

    // 读取图像数据
    for (int i = 0; i < rows; ++i) {
        for (int j = 0; j < cols; ++j) {
            cin >> image[i][j];
        }
    }

    // 进行连通域检测
    connectedComponents(image, rows, cols, k);

    return 0;
}
