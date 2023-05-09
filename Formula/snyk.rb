class Snyk < Formula
  desc "Find & fix known vulnerabilities in open-source dependencies"
  homepage "https://github.com/snyk/snyk"
  version "1.1153.0"

  if OS.mac?
    url "https://static.snyk.io/cli/v1.1153.0/snyk-macos"
    sha256 "6bfed927f4f5bc693298bdb82bb58024c23cbbe1e8bf341ebacb7c854d39172f"
  elsif OS.linux?
    url "https://static.snyk.io/cli/v1.1153.0/snyk-linux"
    sha256 "4369ec030731da87eba99801c2a0f393b850625afbe0f3c8523e65586c306850"
  end

  def install
    bin.install (OS.linux? ? "snyk-linux" : "snyk-macos") => "snyk"
  end

  test do
    assert_match("Authentication failed.", shell_output("#{bin}/snyk auth homebrew-test", 2))
  end
end
