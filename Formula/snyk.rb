class Snyk < Formula
  desc "Find & fix known vulnerabilities in open-source dependencies"
  homepage "https://github.com/snyk/snyk"
  version "1.1048.0"

  if OS.mac?
    url "https://static.snyk.io/cli/v1.1048.0/snyk-macos"
    sha256 "e8063c220e81e5334d8c477f94f4ba4b66973cee8797a5cf403e15395d20b65a"
  elsif OS.linux?
    url "https://static.snyk.io/cli/v1.1048.0/snyk-linux"
    sha256 "b1888e4183a1676544ea5efc63089865835b51383a6bba89a949df81508a81e8"
  end

  def install
    bin.install (OS.linux? ? "snyk-linux" : "snyk-macos") => "snyk"
  end

  test do
    assert_match("Authentication failed.", shell_output("#{bin}/snyk auth homebrew-test", 2))
  end
end
