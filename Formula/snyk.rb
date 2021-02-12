class Snyk < Formula
  desc "Find & fix known vulnerabilities in open-source dependencies"
  homepage "https://github.com/snyk/snyk"
  version "v1.452.0"

  if OS.mac?
    url "https://github.com/snyk/snyk/releases/download/v1.452.0/snyk-macos"
    sha256 "c3a8e36b701935bd371787126d164e536c4c12a4fdc8412c7e67d9a877495825"
  elsif OS.linux?
    url "https://github.com/snyk/snyk/releases/download/v1.452.0/snyk-linux"
    sha256 "18cb24d406bd441a808b678c98737d0a782b6904e312ccaa32bbdab9cd74e340"
  end

  def install
    bin.install (OS.linux? ? "snyk-linux" : "snyk-macos") => "snyk"
  end

  test do
    assert_match("Authentication failed.", shell_output("#{bin}/snyk auth homebrew-test", 2))
  end
end
