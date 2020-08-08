class Snyk < Formula
  desc "Find & fix known vulnerabilities in open-source dependencies"
  homepage "https://github.com/snyk/snyk"
  version "v1.370.0"

  if OS.mac?
    url "https://github.com/snyk/snyk/releases/download/v1.370.0/snyk-macos"
    sha256 "85248f505100640fe9a13565e6f001454d3036dce2cbf0e428e6a63bb35bba83"
  elsif OS.linux?
    url "https://github.com/snyk/snyk/releases/download/v1.370.0/snyk-linux"
    sha256 "1b49c45e107da0613dc9dc7bda4448adca344fc4e1fc4c31a56438720f5e8d4b"
  end

  def install
    bin.install (OS.linux? ? "snyk-linux" : "snyk-macos") => "snyk"
  end

  test do
    assert_match("Authentication failed.", shell_output("#{bin}/snyk auth homebrew-test", 2))
  end
end
