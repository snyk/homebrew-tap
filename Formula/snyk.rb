class Snyk < Formula
  desc "Find & fix known vulnerabilities in open-source dependencies"
  homepage "https://github.com/snyk/snyk"
  version "1.848.0"

  if OS.mac?
    url "https://static.snyk.io/cli/v1.848.0/snyk-macos"
    sha256 "655894d2d5856cae3c70c4d59824cd7fdeccfada46e6a1a09e608100bb3bfbc5"
  elsif OS.linux?
    url "https://static.snyk.io/cli/v1.848.0/snyk-linux"
    sha256 "808f29a26c788ca2a16907e0e6ff83860827147dad2d505d7b7d89b563b8ad39"
  end

  def install
    bin.install (OS.linux? ? "snyk-linux" : "snyk-macos") => "snyk"
  end

  test do
    assert_match("Authentication failed.", shell_output("#{bin}/snyk auth homebrew-test", 2))
  end
end
