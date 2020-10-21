class Snyk < Formula
  desc "Find & fix known vulnerabilities in open-source dependencies"
  homepage "https://github.com/snyk/snyk"
  version "v1.419.0"

  if OS.mac?
    url "https://github.com/snyk/snyk/releases/download/v1.419.0/snyk-macos"
    sha256 "148a07aacefaaf99afc5dce40266673f0cd354fa63cdad2a00852d8c90aeb27c"
  elsif OS.linux?
    url "https://github.com/snyk/snyk/releases/download/v1.419.0/snyk-linux"
    sha256 "5fa4ef48e15a26bb1bb6cd5e0a48c5ccdbb9d625bb1f0180cced59fc722ffc84"
  end

  def install
    bin.install (OS.linux? ? "snyk-linux" : "snyk-macos") => "snyk"
  end

  test do
    assert_match("Authentication failed.", shell_output("#{bin}/snyk auth homebrew-test", 2))
  end
end
