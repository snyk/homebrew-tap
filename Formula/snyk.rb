class Snyk < Formula
  desc "Find & fix known vulnerabilities in open-source dependencies"
  homepage "https://github.com/snyk/snyk"
  version "1.870.0"

  if OS.mac?
    url "https://static.snyk.io/cli/v1.870.0/snyk-macos"
    sha256 "3c31e50c14a609b3aec054d8cf0e97ac82402e9bbad2395b797d4f72d7a9ee60"
  elsif OS.linux?
    url "https://static.snyk.io/cli/v1.870.0/snyk-linux"
    sha256 "2eaa46d2c3945873a70ebcc958fc8b4bc86ce0325214b1043f7ebd818d69fdf8"
  end

  def install
    bin.install (OS.linux? ? "snyk-linux" : "snyk-macos") => "snyk"
  end

  test do
    assert_match("Authentication failed.", shell_output("#{bin}/snyk auth homebrew-test", 2))
  end
end
