const std = @import("std");
const json = std.json;

pub fn main() !void {
    var gpa = std.heap.GeneralPurposeAllocator(.{}){};
    defer _ = gpa.deinit();
    const allocator = gpa.allocator();

    const json_str =
        \\{
        \\  "userid": 103609,
        \\  "verified": true,
        \\  "access_privileges": [
        \\      "user",
        \\      "admin"
        \\  ]
        \\}
    ;
    const T = struct { userid: i32, verified: bool, access_privileges: [][]u8 };
    const parsed = try json.parseFromSlice(T, allocator, json_str, .{});
    defer parsed.deinit();

    const value = parsed.value;

    std.debug.assert(value.userid == 103609);
    std.debug.assert(value.verified);
    std.debug.assert(std.mem.eql(u8, value.access_privileges[0], "user"));
    std.debug.assert(std.mem.eql(u8, value.access_privileges[1], "admin"));
}
