L = [0, 0.612, 0.572, 0, 0, 0];
d = [0.128, 0, 0, 0.164, 0.116, 0.092];
a = [0, -pi/2, 0, 0, pi/2, -pi/2];

theta = sym('th', [1, 6]);

% warning('off', 'all')

%% Forward Kinematics
M_total = eye(4);
for i = 1:1:6
  disp(i)
  M = [
    [cos(theta(i)), -sin(theta(i)), 0, L(i)],
    [sin(theta(i)) * cos(a(i)), cos(theta(i)) * cos(a(i)), -sin(a(i)), -sin(a(i)) * d(i)],
    [sin(theta(i)) * sin(a(i)), cos(theta(i)) * sin(a(i)), cos(a(i)), cos(a(i)) * d(i)],
    [0, 0, 0, 1]
  ];
  disp(M)
  M_total = M_total * M;
end

%% Inverse Kinematics

