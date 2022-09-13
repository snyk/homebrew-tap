class Snyk < Formula
  desc "Find & fix known vulnerabilities in open-source dependencies"
  homepage "https://github.com/snyk/snyk"
  version "1.1002.0"

  if OS.mac?
    url "https://static.snyk.io/cli/v1.1002.0/snyk-macos"
    sha256 "0cc18fa234f0ff573777e6ff63b54334d58e577ba03f8b2e94527b5298b1e915"
  elsif OS.linux?
    url "https://static.snyk.io/cli/v1.1002.0/snyk-linux"
    sha256 "3f3d23b30805b9015115b380b2c51564e88587b576888c0ccff4bcab3f8982cd"
  end

  def install
    bin.install (OS.linux? ? "snyk-linux" : "snyk-macos") => "snyk"
  end

  test do
    assert_match("Authentication failed.", shell_output("#{bin}/snyk auth homebrew-test", 2))
  end
end
