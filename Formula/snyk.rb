class Snyk < Formula
  desc "Find & fix known vulnerabilities in open-source dependencies"
  homepage "https://github.com/snyk/snyk"
  version "v1.230.0"

  if OS.mac?
    url "https://github.com/snyk/snyk/releases/download/v1.230.0/snyk-macos"
    sha256 "676d6c405e8e260c3459bfe054f5fa7dae1a8af6181f5dec7e071dac7f9bc1a4"
  elsif OS.linux?
    url "https://github.com/snyk/snyk/releases/download/v1.230.0/snyk-linux"
    sha256 "981833a9ff3e53cad305b8ec3706a50392d3d06f45b53c7c4d89d377e6cc87ee"
  end

  def install
    original = OS.linux? ? "snyk-linux" : "snyk-macos"
    mv original, "snyk"
    bin.install "snyk"
  end

  test do
    system "#{bin}/snyk --version"
  end
end
