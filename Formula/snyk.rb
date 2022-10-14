class Snyk < Formula
  desc "Find & fix known vulnerabilities in open-source dependencies"
  homepage "https://github.com/snyk/snyk"
  version "1.1029.0"

  if OS.mac?
    url "https://static.snyk.io/cli/v1.1029.0/snyk-macos"
    sha256 "be1604fa63ca3a767e9b2d0bf3155a6f44054b1877870db2aebd3b95b4232db2"
  elsif OS.linux?
    url "https://static.snyk.io/cli/v1.1029.0/snyk-linux"
    sha256 "3d1055998f85f8b3a07546e402d2c924aecfcc1c85983802fed837f7b0a98300"
  end

  def install
    bin.install (OS.linux? ? "snyk-linux" : "snyk-macos") => "snyk"
  end

  test do
    assert_match("Authentication failed.", shell_output("#{bin}/snyk auth homebrew-test", 2))
  end
end
