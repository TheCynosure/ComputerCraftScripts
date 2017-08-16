local f = io.popen("ls .")
if f then print(f:read("*a"))
else print("Failed to read")
end