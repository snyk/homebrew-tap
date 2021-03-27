class Snyk < Formula
  desc "Find & fix known vulnerabilities in open-source dependencies"
  homepage "https://github.com/snyk/snyk"
  version "v1.511.0"

  if OS.mac?
    url "https://github.com/snyk/snyk/releases/download/v1.511.0/snyk-macos"
    sha256 "ccffef36ed454596f544cd2dd1775e8979a37188595a98adbc7ea54004182beb"
  elsif OS.linux?
    url "https://github.com/snyk/snyk/releases/download/v1.511.0/snyk-linux"
    sha256 "80852481765e0f09e26f38d68a75e76aa3ba90f289e51c4540a1f21b8fc43c0a"
  end

  def install
    bin.install (OS.linux? ? "snyk-linux" : "snyk-macos") => "snyk"
  end

  test do
    assert_match("Authentication failed.", shell_output("#{bin}/snyk auth homebrew-test", 2))
  end
end
