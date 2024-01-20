#include <iostream>
#include <vector>

using namespace std;

// 函数：进行开运算
vector<vector<int>> performOpening(const vector<vector<int>>& image, int N, int M) {
    int H = image.size();
    int W = image[0].size();

    // 创建结果数组并初始化为全0
    vector<vector<int>> result(H, vector<int>(W, 0));

    // 进行开运算操作
    for (int i = 0; i < H; i++) {
        for (int j = 0; j < W; j++) {
            // 检查矩形结构元内的所有像素是否都为1
            bool allOnes = true;
            for (int ni = -N / 2; ni <= N / 2; ni++) {
                for (int nj = -M / 2; nj <= M / 2; nj++) {
                    int ti = i + ni;
                    int tj = j + nj;
                    // 检查越界情况
                    if (ti < 0 || ti >= H || tj < 0 || tj >= W || image[ti][tj] != 255) {
                        allOnes = false;
                        break;
                    }
                }
                if (!allOnes) {
                    break;
                }
            }

            // 根据判断结果设置开运算结果数组的值
            if (allOnes) {
                for (int ni = -N / 2; ni <= N / 2; ni++) {
                for (int nj = -M / 2; nj <= M / 2; nj++) {
                    int ti = i + ni;
                    int tj = j + nj;
                    // 检查越界情况
                    if (ti < 0 || ti >= H || tj < 0 || tj >= W ) {
                        
                        break;
                    }
                    result[ti][tj] = 255; 
                }
                
            }
            }
        }
    }

    return result;
}

int main() {
    int N, M;
    cin >> N >> M;

    int H, W;
    cin >> H >> W;

    // 读取待处理图像
    vector<vector<int>> image(H, vector<int>(W));
    for (int i = 0; i < H; i++) {
        for (int j = 0; j < W; j++) {
            cin >> image[i][j];
        }
    }

    // 进行开运算
    vector<vector<int>> result = performOpening(image, N, M);

    // 输出开运算结果
    for (int i = 0; i < H; i++) {
        for (int j = 0; j < W; j++) {
            cout << result[i][j];
            if (j < W - 1) {
                cout << " ";
            }
        }
        cout << endl;
    }

    return 0;
}
