class Snyk < Formula
  desc "Find & fix known vulnerabilities in open-source dependencies"
  homepage "https://github.com/snyk/snyk"
  version "1.671.0"

  if OS.mac?
    url "https://static.snyk.io/cli/v1.671.0/snyk-macos"
    sha256 "961519c7b6e5ac590e6d0362a3f838301576c1e7908197878e5a589435162020"
  elsif OS.linux?
    url "https://static.snyk.io/cli/v1.671.0/snyk-linux"
    sha256 "093064584e5fc377c5c716d651b3d010605e6f7ea866b34dc8ca7e68427da404"
  end

  def install
    bin.install (OS.linux? ? "snyk-linux" : "snyk-macos") => "snyk"
  end

  test do
    assert_match("Authentication failed.", shell_output("#{bin}/snyk auth homebrew-test", 2))
  end
end
