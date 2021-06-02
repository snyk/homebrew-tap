class Snyk < Formula
  desc "Find & fix known vulnerabilities in open-source dependencies"
  homepage "https://github.com/snyk/snyk"
  version "v1.620.0"

  if OS.mac?
    url "https://github.com/snyk/snyk/releases/download/v1.620.0/snyk-macos"
    sha256 "2bf175396d23ae669817b9d2060df82141a285b396a65e47b3bab9e245f0a1a6"
  elsif OS.linux?
    url "https://github.com/snyk/snyk/releases/download/v1.620.0/snyk-linux"
    sha256 "68ed3d38a58e21b8487d402d9e5283aca079bb58691361b12ac840430e2c134f"
  end

  def install
    bin.install (OS.linux? ? "snyk-linux" : "snyk-macos") => "snyk"
  end

  test do
    assert_match("Authentication failed.", shell_output("#{bin}/snyk auth homebrew-test", 2))
  end
end
