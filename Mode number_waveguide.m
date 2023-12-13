% Parameters
thickness = 10e-6;  % 波导厚度，单位：米
NA = 0.4;          % 波导数值孔径
ncore = 3.6;       % 波导芯层折射率

% 计算V数（V-number）
lambda = 1.55e-6;  % 波长，单位：米
a = NA * lambda / (2 * pi * ncore);  % 半径，单位：米
V = 2 * pi * a / lambda;              % V数

% 利用V数估算模式数
modes = floor(V^2 / 2);

disp(['Number of modes: ' num2str(modes)]);

% 利用V数估算最高阶模式的有效折射率
neff_higher_order = ncore * sqrt(1 - (V/NA)^2);

disp(['Effective index for highest order mode: ' num2str(neff_higher_order)]);

% 计算波导到空气界面的反射率和透射率（正入射情况）
n_air = 1;  % 空气折射率

% 反射率的计算
R = ((ncore - n_air)/(ncore + n_air))^2;

% 透射率的计算
T = 1 - R;

disp(['Reflectivity: ' num2str(R)]);
disp(['Transmissivity: ' num2str(T)]);
