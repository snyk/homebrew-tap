class Snyk < Formula
  desc "Find & fix known vulnerabilities in open-source dependencies"
  homepage "https://github.com/snyk/snyk"
  version "v1.434.4"

  if OS.mac?
    url "https://github.com/snyk/snyk/releases/download/v1.434.4/snyk-macos"
    sha256 "9632a1980e0a48db6e0074ca80281c707e886b42775aa7918d7632c158215704"
  elsif OS.linux?
    url "https://github.com/snyk/snyk/releases/download/v1.434.4/snyk-linux"
    sha256 "6eaba0ea216f290ad96a7beef5e499bfd67e2531bb5b3293f2e499abd8cad489"
  end

  def install
    bin.install (OS.linux? ? "snyk-linux" : "snyk-macos") => "snyk"
  end

  test do
    assert_match("Authentication failed.", shell_output("#{bin}/snyk auth homebrew-test", 2))
  end
end
