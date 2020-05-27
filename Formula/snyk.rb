class Snyk < Formula
  desc "Find & fix known vulnerabilities in open-source dependencies"
  homepage "https://github.com/snyk/snyk"
  version "v1.329.0"

  if OS.mac?
    url "https://github.com/snyk/snyk/releases/download/v1.329.0/snyk-macos"
    sha256 "9829e943c7d76fa97cb0ba175335f19785d0c82ff3813c96acac5796504d2b11"
  elsif OS.linux?
    url "https://github.com/snyk/snyk/releases/download/v1.329.0/snyk-linux"
    sha256 "c8e120133d76952fc97cba99a345b9ac24d806660ba82ab76c936fe75fc1d3d0"
  end

  def install
    bin.install (OS.linux? ? "snyk-linux" : "snyk-macos") => "snyk"
  end

  test do
    assert_match("Authentication failed.", shell_output("#{bin}/snyk auth homebrew-test", 2))
  end
end
