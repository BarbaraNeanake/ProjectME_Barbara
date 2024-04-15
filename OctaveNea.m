%Code Program Octave - Project Pra UTS ME
%Barbara Neanake Ajiesti (22/494495/TK/54328)

% Welcome Message
output = sprintf('Halo! Selamat datang^^\nPastikan kamu sudah memiliki persamaan Medan Elekromagnetik.\n');
disp(output);
Ex_0 = input('Silakan masukkan elemen medan listrik pada koordinat x: ');
Ey_0 = input('Silakan masukkan elemen medan listrik pada koordinat y: ');
Ez_0 = input('Silakan masukkan elemen medan listrik pada koordinat z: ');

%Meminta User memasukkan input
bagian1= input('Silakan masukkan nama bagian tubuh pertama: ', 's');
bagian1_pr = input('Berapa angka permitivitas relatif bagian tubuh pertama itu?: ');
bagian2 = input('Silakan masukkan nama bagian kedua: ', 's');
bagian2_pr = input('Berapa angka permitivitas relatif bagian tubuh kedua itu?: ');
bagian3 = input('Silakan masukkan nama bagian ketiga: ', 's');
bagian3_pr = input('Berapa angka permitivitas relatif bagian tubuh ketiga itu?: ');

%Mulai menghitung magnitud medan listrik
magnitude_0 = sqrt(Ex_0^2 + Ey_0^2 + Ez_0^2);

%Lalu menghitung komponen medan listrik di setiap bagian tubuh
Ex_organ1= Ex_0 / bagian1_pr
Ey_organ1= Ey_0
Ez_organ1= Ez_0
magnitude_organ1 = sqrt(Ex_organ1^2 + Ey_organ1^2 + Ez_organ1^2);

Ex_organ2 = Ex_0 / bagian2_pr
Ey_organ2 = Ey_0
Ez_organ2 = Ez_0
magnitude_organ2 = sqrt(Ex_organ2^2 + Ey_organ2^2 + Ez_organ2^2);

Ex_organ3 = Ex_0 / bagian3_pr;
Ey_organ3 = Ey_0;
Ez_organ3 = Ez_0;
magnitude_organ3 = sqrt(Ex_organ3^2 + Ey_organ3^2 + Ez_organ3^2);

% Create meshgrid
[x_0, y_0, z_0] = meshgrid(0:0.25:0.4, 0:0.25:1.2, 0:0.25:1.2);
[x_jaringan1, y_jaringan1, z_jaringan1] = meshgrid(0.6:0.25:1.2, 0:0.25:1.2, 0.8:0.25:1.2);
[x_jaringan2, y_jaringan2, z_jaringan2] = meshgrid(0.6:0.25:0.9, 0:0.25:1.2, 0:0.25:0.8);
[x_jaringan3, y_jaringan3, z_jaringan3] = meshgrid(0.9:0.25:1.2, 0:0.25:1.2, 0:0.25:0.8);

% Membuat grid untuk vektor medan listrik
Ex_0_grid = Ex_0 * ones(size(x_0));
Ey_0_grid = Ey_0 * ones(size(y_0));
Ez_0_grid = Ez_0 * ones(size(z_0));

Ex_organ1_grid = Ex_organ1 * ones(size(x_bagian1));
Ey_organ1_grid = Ey_organ1 * ones(size(y_bagian1));
Ez_organ1_grid = Ez_organ1 * ones(size(z_bagian1));

Ex_organ2_grid = Ex_organ2 * ones(size(x_bagian2));
Ey_organ2_grid = Ey_organ2 * ones(size(y_bagian2));
Ez_organ2_grid = Ez_organ2 * ones(size(z_bagian2));

Ex_organ3_grid = Ex_organ3 * ones(size(x_bagian3));
Ey_organ3_grid = Ey_organ3 * ones(size(y_bagian3));
Ez_organ3_grid = Ez_organ3 * ones(size(z_bagian3));

magnitude = [magnitude_organ1, magnitude_organ2, magnitude_organ3];
min_val = min(magnitude);
max_val = max(magnitude);
magnitude = (magnitude - min_val) / (max_val - min_val);

num_colors = 100;

colormap_custom = zeros(num_colors, 3);

colormap_custom(:, 3) = linspace(0, 1, num_colors);
colormap_custom(:, 2) = 0;
colormap_custom(:, 1) = linspace(1, 0, num_colors);

% Menampilkan visualisasi 3D
figure;
quiver3(x_0, y_0, z_0, Ex_0_grid, Ey_0_grid, Ez_0_grid, 'Color', 'Black');
hold on;
quiver3(x_bagian1, y_bagian1, z_bagian1, Ex_organ1_grid, Ey_organ1_grid, Ez_organ1_grid, 'Color', [1-magnitude(1), 0, magnitude(1)]);
hold on;
quiver3(x_bagian2, y_bagian2, z_bagian2, Ex_organ2_grid, Ey_organ2_grid, Ez_organ2_grid, 'Color', [1-magnitude(2), 0, magnitude(2)]);
hold on;
quiver3(x_bagian3, y_bagian3, z_bagian3, Ex_organ3_grid, Ey_organ3_grid, Ez_organ3_grid, 'Color', [1-magnitude(3), 0, magnitude(3)]);

% Melengkapi sumbu dan grafik dengan label
xlabel('x');
ylabel('y');
zlabel('z');
title('Visualisasi 3D Medan Listrik oleh Barbara Neanake A. - Kelas ME B', 'FontSize', 25, 'FontName', 'Times New Roman');
axis equal;
grid on;
hold on;

% Menambahkan teks untuk informasi nama bagian dan juga magnitude
mag1String = ['Magnitude: ', num2str(magnitude_organ1)]
mag2String = ['Magnitude: ', num2str(magnitude_organ2)]
mag3String = ['Magnitude: ', num2str(magnitude_organ3)]
mag0String = ['Magnitude: ', num2str(magnitude_0)]
text(1, 0.9, 1.2, bagian1, 'FontSize', 20, 'Color', 'black', 'HorizontalAlignment', 'center', 'BackgroundColor', 'yellow', 'FontName', 'Times New Roman');
text(1, 0.9, 1.1, mag1String, 'FontSize', 15, 'Color', 'black', 'HorizontalAlignment', 'center', 'BackgroundColor', 'yellow', 'FontName', 'Times New Roman');
text(0.70, 0.1, 0.3, bagian2, 'FontSize', 20, 'Color', 'black', 'HorizontalAlignment', 'center', 'BackgroundColor', 'yellow', 'FontName', 'Times New Roman');
text(0.70, 0.1, 0.2, mag2String, 'FontSize', 15, 'Color', 'black', 'HorizontalAlignment', 'center', 'BackgroundColor', 'yellow', 'FontName', 'Times New Roman');
text(1, 0, 0.6, bagian3, 'FontSize', 20, 'Color', 'black', 'HorizontalAlignment', 'center', 'BackgroundColor', 'yellow', 'FontName', 'Times New Roman');
text(1, 0, 0.5, mag3String, 'FontSize', 15, 'Color', 'black', 'HorizontalAlignment', 'center', 'BackgroundColor', 'yellow', 'FontName', 'Times New Roman');
text(0, 0.85, 0.6, 'Udara', 'FontSize', 20, 'Color', 'white', 'HorizontalAlignment', 'center', 'BackgroundColor', 'black', 'FontName', 'Times New Roman');
text(0, 0.85, 0.5, mag0String, 'FontSize', 15, 'Color', 'white', 'HorizontalAlignment', 'center', 'BackgroundColor', 'black', 'FontName', 'Times New Roman');

% Membuat bidang (wall) sesuai dengan kasus awal
x_wall1 = [0.6, 0.6, 0.6, 0.6];
y_wall1 = [0, 1.2, 1.2, 0];
z_wall1 = [0, 0, 1.2, 1.2];
patch(x_wall1, y_wall1, z_wall1, 'b', 'FaceAlpha', 0.2);

x_wall2 = [0.6, 1.2, 1.2, 0.6];
y_wall2 = [0, 0, 1.2, 1.2];
z_wall2 = [0.8, 0.8, 0.8, 0.8];
patch(x_wall2, y_wall2, z_wall2, 'b', 'FaceAlpha', 0.2);

x_wall3 = [0.9, 0.9, 0.9, 0.9];
y_wall3 = [0, 1.2, 1.2, 0];
z_wall3 = [0, 0, 0.8, 0.8];
patch(x_wall3, y_wall3, z_wall3, 'b', 'FaceAlpha', 0.2);

% Menetapkan colormap dan colorbar
colormap(colormap_custom);
caxis([min_val, max_val]);
cb = colorbar();
yl = ylabel(cb,'Electric Field in Organs Magnitude','FontSize',1.26, 'FontName', 'Times New Roman');
