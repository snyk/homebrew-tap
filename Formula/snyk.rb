class Snyk < Formula
  desc "Find & fix known vulnerabilities in open-source dependencies"
  homepage "https://github.com/snyk/snyk"
  version "v1.297.3"

  if OS.mac?
    url "https://github.com/snyk/snyk/releases/download/v1.297.3/snyk-macos"
    sha256 "b94f15f4081ac0cae266d84d701d93db7f762da0b749b4369bc8e595333ba29d"
  elsif OS.linux?
    url "https://github.com/snyk/snyk/releases/download/v1.297.3/snyk-linux"
    sha256 "40afde378a15c08e592cb8faec7d5db28e2b67ff274a99b88b2e3f511a20d21f"
  end

  def install
    bin.install (OS.linux? ? "snyk-linux" : "snyk-macos") => "snyk"
  end

  test do
    assert_match("Authentication failed.", shell_output("#{bin}/snyk auth homebrew-test", 2))
  end
end
