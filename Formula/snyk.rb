class Snyk < Formula
  desc "Find & fix known vulnerabilities in open-source dependencies"
  homepage "https://github.com/snyk/snyk"
  version "v1.541.0"

  if OS.mac?
    url "https://github.com/snyk/snyk/releases/download/v1.541.0/snyk-macos"
    sha256 "7c6405e1f5f42b66e6120c6c3ecd8634dee7ea1f309252e905a391bd8340126d"
  elsif OS.linux?
    url "https://github.com/snyk/snyk/releases/download/v1.541.0/snyk-linux"
    sha256 "4ba7a1235474323e531f1c9208d52af9b7a725597334edc41b50ac2c760bf44c"
  end

  def install
    bin.install (OS.linux? ? "snyk-linux" : "snyk-macos") => "snyk"
  end

  test do
    assert_match("Authentication failed.", shell_output("#{bin}/snyk auth homebrew-test", 2))
  end
end
