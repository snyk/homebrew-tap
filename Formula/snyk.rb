class Snyk < Formula
  desc "Find & fix known vulnerabilities in open-source dependencies"
  homepage "https://github.com/snyk/snyk"
  version "1.952.0"

  if OS.mac?
    url "https://static.snyk.io/cli/v1.952.0/snyk-macos"
    sha256 "8424c74688b2b45d15a2a8f84c6dce2b74fe6ef4e4233c08b3e10f4ed31e7e64"
  elsif OS.linux?
    url "https://static.snyk.io/cli/v1.952.0/snyk-linux"
    sha256 "bda976da5c0c499a5729c0b0eaf445d5818a7db35aa980f4aeff0c19985cf91e"
  end

  def install
    bin.install (OS.linux? ? "snyk-linux" : "snyk-macos") => "snyk"
  end

  test do
    assert_match("Authentication failed.", shell_output("#{bin}/snyk auth homebrew-test", 2))
  end
end
