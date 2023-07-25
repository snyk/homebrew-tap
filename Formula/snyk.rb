class Snyk < Formula
  desc "Find & fix known vulnerabilities in open-source dependencies"
  homepage "https://github.com/snyk/snyk"
  version "1.1194.0"

  if OS.mac?
    url "https://static.snyk.io/cli/v1.1194.0/snyk-macos"
    sha256 "89c3f4dcd45058ebf395f5700dde568164fd4d2c8d2619caccae2968c3c9abe0"
  elsif OS.linux?
    url "https://static.snyk.io/cli/v1.1194.0/snyk-linux"
    sha256 "d53479c5a7e7561717de2c7a807f6faa3172489bfdf339114fe58227b3c3f496"
  end

  def install
    bin.install (OS.linux? ? "snyk-linux" : "snyk-macos") => "snyk"
  end

  test do
    assert_match("Authentication failed.", shell_output("#{bin}/snyk auth homebrew-test", 2))
  end
end
