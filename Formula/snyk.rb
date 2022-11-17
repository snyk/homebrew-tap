class Snyk < Formula
  desc "Find & fix known vulnerabilities in open-source dependencies"
  homepage "https://github.com/snyk/snyk"
  version "1.1060.0"

  if OS.mac?
    url "https://static.snyk.io/cli/v1.1060.0/snyk-macos"
    sha256 "75adbb474053202feb8f710db2c3e07062d3f92cdf791f7879a8036151055315"
  elsif OS.linux?
    url "https://static.snyk.io/cli/v1.1060.0/snyk-linux"
    sha256 "ab4a4403df830d89d420639b2b9e024dfda66298e943c6ed049cc0d9f8b4cac2"
  end

  def install
    bin.install (OS.linux? ? "snyk-linux" : "snyk-macos") => "snyk"
  end

  test do
    assert_match("Authentication failed.", shell_output("#{bin}/snyk auth homebrew-test", 2))
  end
end
