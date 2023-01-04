class Snyk < Formula
  desc "Find & fix known vulnerabilities in open-source dependencies"
  homepage "https://github.com/snyk/snyk"
  version "1.1081.0"

  if OS.mac?
    url "https://static.snyk.io/cli/v1.1081.0/snyk-macos"
    sha256 "e8894f11f2cfbdd75b5994569dae8460918fafc2c44411b4008fdb69a1bf7ef6"
  elsif OS.linux?
    url "https://static.snyk.io/cli/v1.1081.0/snyk-linux"
    sha256 "e2291f1613318c83909872d53d047b2500b69c21aec0bdf824b85fcc3742a8d3"
  end

  def install
    bin.install (OS.linux? ? "snyk-linux" : "snyk-macos") => "snyk"
  end

  test do
    assert_match("Authentication failed.", shell_output("#{bin}/snyk auth homebrew-test", 2))
  end
end
