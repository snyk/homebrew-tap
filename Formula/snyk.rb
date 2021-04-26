class Snyk < Formula
  desc "Find & fix known vulnerabilities in open-source dependencies"
  homepage "https://github.com/snyk/snyk"
  version "v1.564.0"

  if OS.mac?
    url "https://github.com/snyk/snyk/releases/download/v1.564.0/snyk-macos"
    sha256 "420353dd33607cc74393218f86736443dcf80c3dde473533276f7e2df52e115e"
  elsif OS.linux?
    url "https://github.com/snyk/snyk/releases/download/v1.564.0/snyk-linux"
    sha256 "6315eca198590f02c073daa482f7e0950a67bab6fc70ea89170e9f60edcf126f"
  end

  def install
    bin.install (OS.linux? ? "snyk-linux" : "snyk-macos") => "snyk"
  end

  test do
    assert_match("Authentication failed.", shell_output("#{bin}/snyk auth homebrew-test", 2))
  end
end
