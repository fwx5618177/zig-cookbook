const std = @import("std");
const fs = std.fs;
const print = std.debug.print;
const Sha256 = std.crypto.hash.sha2.Sha256;

fn sha256_digest(reader: fs.File.Reader) ![32]u8 {
    var gpa = std.heap.GeneralPurposeAllocator(.{}){};
    defer _ = gpa.deinit();
    const alloc = gpa.allocator();

    var hash = Sha256.init(.{});
    while (try reader.readUntilDelimiterOrEofAlloc(alloc, '\n', 4096)) |line| {
        defer alloc.free(line);
        hash.update(line);
    }

    var out: [32]u8 = undefined;
    hash.final(out[0..]);
    return out;
}

pub fn main() !void {
    const path = "file.txt";
    const file = try fs.cwd().openFile(path, .{.mode=.write_only});
    errdefer file.close();

    try file.writeAll("We will generate a digest of this text");
    file.close();

    const f = try fs.cwd().openFile(path, .{});
    defer f.close();

    const digest = try sha256_digest(f.reader());

    print("SHA-256 digest is {s}", .{std.fmt.fmtSliceHexLower(&digest)});
}
