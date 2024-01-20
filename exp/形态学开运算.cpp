#include <iostream>
#include <vector>

using namespace std;

// ���������п�����
vector<vector<int>> performOpening(const vector<vector<int>>& image, int N, int M) {
    int H = image.size();
    int W = image[0].size();

    // ����������鲢��ʼ��Ϊȫ0
    vector<vector<int>> result(H, vector<int>(W, 0));

    // ���п��������
    for (int i = 0; i < H; i++) {
        for (int j = 0; j < W; j++) {
            // �����νṹԪ�ڵ����������Ƿ�Ϊ1
            bool allOnes = true;
            for (int ni = -N / 2; ni <= N / 2; ni++) {
                for (int nj = -M / 2; nj <= M / 2; nj++) {
                    int ti = i + ni;
                    int tj = j + nj;
                    // ���Խ�����
                    if (ti < 0 || ti >= H || tj < 0 || tj >= W || image[ti][tj] != 255) {
                        allOnes = false;
                        break;
                    }
                }
                if (!allOnes) {
                    break;
                }
            }

            // �����жϽ�����ÿ������������ֵ
            if (allOnes) {
                for (int ni = -N / 2; ni <= N / 2; ni++) {
                for (int nj = -M / 2; nj <= M / 2; nj++) {
                    int ti = i + ni;
                    int tj = j + nj;
                    // ���Խ�����
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

    // ��ȡ������ͼ��
    vector<vector<int>> image(H, vector<int>(W));
    for (int i = 0; i < H; i++) {
        for (int j = 0; j < W; j++) {
            cin >> image[i][j];
        }
    }

    // ���п�����
    vector<vector<int>> result = performOpening(image, N, M);

    // �����������
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
