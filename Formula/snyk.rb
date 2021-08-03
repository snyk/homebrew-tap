class Snyk < Formula
  desc "Find & fix known vulnerabilities in open-source dependencies"
  homepage "https://github.com/snyk/snyk"
  version "1.673.0"

  if OS.mac?
    url "https://static.snyk.io/cli/v1.673.0/snyk-macos"
    sha256 "20ff8a571291359e94584b73e29db84b7bb38892df290b8b11a2b410314b69f2"
  elsif OS.linux?
    url "https://static.snyk.io/cli/v1.673.0/snyk-linux"
    sha256 "43a51732ce327c742e3fddcf73ec29db69576f542c45bdd57d369d1e201e225e"
  end

  def install
    bin.install (OS.linux? ? "snyk-linux" : "snyk-macos") => "snyk"
  end

  test do
    assert_match("Authentication failed.", shell_output("#{bin}/snyk auth homebrew-test", 2))
  end
end
