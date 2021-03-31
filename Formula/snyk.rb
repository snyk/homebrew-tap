class Snyk < Formula
  desc "Find & fix known vulnerabilities in open-source dependencies"
  homepage "https://github.com/snyk/snyk"
  version "v1.518.0"

  if OS.mac?
    url "https://github.com/snyk/snyk/releases/download/v1.518.0/snyk-macos"
    sha256 "28553eee903b9b50c7834b71bf719adf99f2806f0b48c8e3b70f60748292cbbe"
  elsif OS.linux?
    url "https://github.com/snyk/snyk/releases/download/v1.518.0/snyk-linux"
    sha256 "170f5ae7bd7469edde755b4baa2ad775cae185c0af1856c7d41e56b83a989979"
  end

  def install
    bin.install (OS.linux? ? "snyk-linux" : "snyk-macos") => "snyk"
  end

  test do
    assert_match("Authentication failed.", shell_output("#{bin}/snyk auth homebrew-test", 2))
  end
end
