x = linspace(0, 1.2, 1000);
y = zeros(1, 1000);
for n = 1:1000
    if x(n) <= 0.1782
        y(n) = 713.36 * x(n);
    elseif x(n) > 0.1782
        y(n) = 713.36 * x(n) + 837.77*(x(n)-0.1782);
    end
end
plot(x, y)
xlabel("Distance x from the left hand side (m)");
ylabel("Shear stress (N)");
