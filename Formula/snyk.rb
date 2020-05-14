class Snyk < Formula
  desc "Find & fix known vulnerabilities in open-source dependencies"
  homepage "https://github.com/snyk/snyk"
  version "v1.320.3"

  if OS.mac?
    url "https://github.com/snyk/snyk/releases/download/v1.320.3/snyk-macos"
    sha256 "99924c5a5a248b52d10bfb1c0e3f6b80a130bd8f14c949f7e2948778fc438dcc"
  elsif OS.linux?
    url "https://github.com/snyk/snyk/releases/download/v1.320.3/snyk-linux"
    sha256 "642c902d29648ec0b9ef30f56858d9a2694c0d7a381e05528f2a0fd3da9da4b3"
  end

  def install
    bin.install (OS.linux? ? "snyk-linux" : "snyk-macos") => "snyk"
  end

  test do
    assert_match("Authentication failed.", shell_output("#{bin}/snyk auth homebrew-test", 2))
  end
end
