class Snyk < Formula
  desc "Find & fix known vulnerabilities in open-source dependencies"
  homepage "https://github.com/snyk/snyk"
  version "1.1189.0"

  if OS.mac?
    url "https://static.snyk.io/cli/v1.1189.0/snyk-macos"
    sha256 "ae31ac1619bd56367adc569c2092ab4a02cea8ff3e7866a113bb437b92fc723e"
  elsif OS.linux?
    url "https://static.snyk.io/cli/v1.1189.0/snyk-linux"
    sha256 "6f0a107a78a322156d961e7c1ba46bd7875da848dbb6c3c4e819c4ead94bcfce"
  end

  def install
    bin.install (OS.linux? ? "snyk-linux" : "snyk-macos") => "snyk"
  end

  test do
    assert_match("Authentication failed.", shell_output("#{bin}/snyk auth homebrew-test", 2))
  end
end
