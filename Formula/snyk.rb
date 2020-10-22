class Snyk < Formula
  desc "Find & fix known vulnerabilities in open-source dependencies"
  homepage "https://github.com/snyk/snyk"
  version "v1.419.1"

  if OS.mac?
    url "https://github.com/snyk/snyk/releases/download/v1.419.1/snyk-macos"
    sha256 "333ae4b1a38487761f4035d9e13365b972040719274ae67105015905b208a2f2"
  elsif OS.linux?
    url "https://github.com/snyk/snyk/releases/download/v1.419.1/snyk-linux"
    sha256 "da88ec166b4a8ab1ff1b6fa3d642e509fc9ac9c590539599cf03c378cc43a860"
  end

  def install
    bin.install (OS.linux? ? "snyk-linux" : "snyk-macos") => "snyk"
  end

  test do
    assert_match("Authentication failed.", shell_output("#{bin}/snyk auth homebrew-test", 2))
  end
end
