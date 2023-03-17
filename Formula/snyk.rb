class Snyk < Formula
  desc "Find & fix known vulnerabilities in open-source dependencies"
  homepage "https://github.com/snyk/snyk"
  version "1.1121.0"

  if OS.mac?
    url "https://static.snyk.io/cli/v1.1121.0/snyk-macos"
    sha256 "e55d471b3ff3d02db23edbff3d89c725862542f43809cec910fbbf05980d6475"
  elsif OS.linux?
    url "https://static.snyk.io/cli/v1.1121.0/snyk-linux"
    sha256 "6e5ba87cf10093eb3f4450306140b37293bbf03c766d7aeb170d258fb523fa07"
  end

  def install
    bin.install (OS.linux? ? "snyk-linux" : "snyk-macos") => "snyk"
  end

  test do
    assert_match("Authentication failed.", shell_output("#{bin}/snyk auth homebrew-test", 2))
  end
end
