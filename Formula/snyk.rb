class Snyk < Formula
  desc "Find & fix known vulnerabilities in open-source dependencies"
  homepage "https://github.com/snyk/snyk"
  version "1.989.0"

  if OS.mac?
    url "https://static.snyk.io/cli/v1.989.0/snyk-macos"
    sha256 "f8fec33be72ef940d2f5bebba685d26da2919bd79c7a3054a367d34176d6f9ed"
  elsif OS.linux?
    url "https://static.snyk.io/cli/v1.989.0/snyk-linux"
    sha256 "dfb342529f66b25c4d9aa1fe8b8b80898235f35873a47d3da511a7e3bf3bfe77"
  end

  def install
    bin.install (OS.linux? ? "snyk-linux" : "snyk-macos") => "snyk"
  end

  test do
    assert_match("Authentication failed.", shell_output("#{bin}/snyk auth homebrew-test", 2))
  end
end
