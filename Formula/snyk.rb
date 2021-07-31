class Snyk < Formula
  desc "Find & fix known vulnerabilities in open-source dependencies"
  homepage "https://github.com/snyk/snyk"
  version "1.672.0"

  if OS.mac?
    url "https://static.snyk.io/cli/v1.672.0/snyk-macos"
    sha256 "7a7c2fe3525770e189805e5083bde185adefbe652fce4b4c6e6053cf010d731c"
  elsif OS.linux?
    url "https://static.snyk.io/cli/v1.672.0/snyk-linux"
    sha256 "eb48be1f2375259ccc33e0bbe401ab5ec98cda319aa6a72ebb85f6a8fc7f900e"
  end

  def install
    bin.install (OS.linux? ? "snyk-linux" : "snyk-macos") => "snyk"
  end

  test do
    assert_match("Authentication failed.", shell_output("#{bin}/snyk auth homebrew-test", 2))
  end
end
