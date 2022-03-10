class Snyk < Formula
  desc "Find & fix known vulnerabilities in open-source dependencies"
  homepage "https://github.com/snyk/snyk"
  version "1.865.0"

  if OS.mac?
    url "https://static.snyk.io/cli/v1.865.0/snyk-macos"
    sha256 "9f4a18971c323bce5ae4498f49e38003939f6e4e3d0ccece870e304956598d1f"
  elsif OS.linux?
    url "https://static.snyk.io/cli/v1.865.0/snyk-linux"
    sha256 "bff8c6e6594c23f8c7f12d3ee5296c8d8c591881ac7f30739817783fa178dfd6"
  end

  def install
    bin.install (OS.linux? ? "snyk-linux" : "snyk-macos") => "snyk"
  end

  test do
    assert_match("Authentication failed.", shell_output("#{bin}/snyk auth homebrew-test", 2))
  end
end
